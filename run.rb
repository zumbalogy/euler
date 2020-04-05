# TODO: docs

START_TS = Time.now.to_i

def tmp_path(f, lang)
  base = File.basename(f)
  "/tmp/#{base}.#{lang}_exe.#{START_TS}"
end

runners = {
  clj: -> f { `clj #{f}` },
  ex:  -> f { `elixir #{f}` },
  fs:  -> f { `gforth #{f} -e bye` },
  js:  -> f { `node #{f}` },
  rb:  -> f { `ruby #{f}` },
  rkt: -> f { `racket #{f}` },
  c:   -> f {
    out = tmp_path(f, :c)
    `
      gcc -o #{out} #{f}
      #{out}
    `
  },
  f90: -> f {
    out = tmp_path(f, :fortran)
    `
      gfortran -o #{out} #{f}
      #{out}
    `
  },
  java: -> f {
    base = File.basename(f, '.java')
    `
      javac -d /tmp #{f}
      java -classpath /tmp p#{base}
    `
  },
}

dirs = ARGV.select { |x| x[/^\d/] }.map { |x| x.rjust(3, '0') }
exts = ARGV.select { |x| x[/^\D/] }.map { |x| x.to_sym }

dirs = (`ls`).scan(/\d+/) unless dirs.any?
exts = runners.keys.sort unless exts.any?

dirs.uniq!
dirs.sort!

def get_key(dir)
  return unless File.file?("#{dir}/solution")
  File.read("#{dir}/solution").strip
end

def format(dir, ext, res, key, time)
  correct = key == res.to_f.to_s.sub(/\.0+$/, '')
  str = ''
  str += res.strip.rjust(16)
  str += " | ." if key && correct
  str += " | X (#{key})" if key && !correct
  str += " | ?" if key == nil
  str = str.ljust(36)
  str += dir.to_i.to_s.rjust(3)
  str += ' '
  str += ext.to_s.ljust(6)
  str += "#{time.to_s[0..5]}s"
  str
end

dirs.each do |dir|
  num = dir.to_i.to_s
  key = get_key(dir)
  exts.each do |ext|
    file = "#{dir}/#{num}.#{ext}"
    next unless File.file?(file)
    start = Time.now
    res = runners[ext].call(file)
    time = Time.now - start
    puts format(dir, ext, res, key, time)
  end
  puts if exts.length > 1
end
