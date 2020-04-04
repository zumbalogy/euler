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

def get_key(dir)
  return unless File.file?("#{dir}/solution")
  File.read("#{dir}/solution").strip
end

def format(dir, ext, res, key, time)
  str = dir.to_i.to_s.rjust(3)
  str += ' '
  str += ext.to_s.ljust(6)
  str += '|'
  str += res.rjust(14)
  str += " | ." if key && key == res
  str += " | X (#{key})" if key && key != res
  str += " | ?" if key == nil
  str = str.ljust(40)
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
    res = runners[ext].call(file).to_f.to_s.sub(/\.0+$/, '')
    time = Time.now - start
    puts format(dir, ext, res, key, time)
  end
  puts if exts.length > 1
end
