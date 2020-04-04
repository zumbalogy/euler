# TODO: docs


runners = {
  clj: -> f { `clj #{f}` },
  ex:  -> f { `elixir #{f}` },
  js:  -> f { `node #{f}` },
  rb:  -> f { `ruby #{f}` },
  rkt: -> f { `racket #{f}` },
}

dirs = (`ls`).scan(/\d+/)
langs = runners.keys

arg_dirs = ARGV.select { |x| x[/\d+/] }.map { |x| x.rjust(3, '0') }
arg_langs = ARGV.select { |x| x[/\D+/] }

dirs = arg_dirs if arg_dirs.any?
langs = arg_langs.map(&:to_sym) if arg_langs.any?

def get_key(dir)
  return unless File.file?("#{dir}/solution")
  File.read("#{dir}/solution").strip
end

def format(dir, lang, res, key, time)
  str = dir.to_i.to_s.rjust(3)
  str += ' '
  str += lang.to_s.ljust(6)
  str += '|'
  str += res.rjust(10)
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
  langs.each do |lang|
    file = "#{dir}/#{num}.#{lang}"
    next unless File.file?(file)
    start = Time.now
    res = runners[lang].call(file).to_f.to_s.sub!(/\.0+$/, '')
    time = Time.now - start
    puts format(dir, lang, res, key, time)
  end
  puts if langs.length > 1
end
