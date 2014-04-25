class Line
    def initialize x1 y1 x2 y2
        @slope = (x2 - x1) / (y2 - y1).to_f
        @intercept = y1 - (@slope * x1)
    end

    def
end

triangles = File.readlines('./triangles.txt').map do |line|
    tri = line.split(',').map(&:to_i)
    [[tri[0],tri[1]],[tri[2],tri[3]],[tri[4],tri[5]]]
end

