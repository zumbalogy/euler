# TODO: docs


runners = {
  clj: -> f { `clj #{f}` },
  ex:  -> f { `elixir #{f}` },
  js:  -> f { `node #{f}` },
  rb:  -> f { `ruby #{f}` },
  rkt: -> f { `racket #{f}` },
}

dirs = ARGV.select { |x| x[/\d+/] }.map { |x| x.rjust(3, '0') }
exts = ARGV.select { |x| x[/\D+/] }.map { |x| x.to_sym }

dirs = (`ls`).scan(/\d+/) unless dirs.any?
exts = runners.keys unless exts.any?

dirs.uniq!
dirs.sort!

def get_key(dir)
  return unless File.file?("#{dir}/solution")
  File.read("#{dir}/solution").strip
end

def format(dir, ext, res, key, time)
  # return "echo #{res} > #{dir}/solution"
  correct = key == res.to_f.to_s.sub(/\.0+$/, '')
  str = ''
  str += res.strip.rjust(16)
  str += " | ." if key && correct
  str += " | X (#{key})" if key && !correct
  str += " | ?" if key == nil
  str = str.ljust(32)
  str += dir.to_i.to_s.rjust(3)
  str += ' '
  str += ext.to_s.ljust(6)
  str += "#{time}s"
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
