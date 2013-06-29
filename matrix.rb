def spiral(num)
	num = num.to_i
	float_root = Math.sqrt num
	root = float_root.to_i
	raise "n is not a perfect square!" if root != float_root || root === 0

	x = (root/2).ceil
	y = root % 2 === 0 ? x - 1 : x
	val = 1

	mx = Array.new(root) { Array.new(root) } # map an empty matrix
	mx[x][y] = 1 # set start

	1.upto(root) do |step|
		1.upto(step*2) do |n|
			break if val >= num

			if n > step
				x = step % 2 === 0 ? x.next : x.pred
			else
				y = step % 2 === 0 ? y.pred : y.next
			end

			val += 1
			mx[x][y] = val
		end
	end
	mx
end

def matrix_print(mx)
	num = mx.count**2
	max = num.to_s.size+1

	out = "  Input:  #{num}\n"
	mx.each_with_index do |a, i|
		prefix = i == 0 ? "  Output: " : " "*10;
		out += prefix + a.map {|v| v = v.to_s+' '*(max - v.to_s.size)}.join + "\n"
	end

	File.open('result.txt', 'a+').puts(out+"\n"*3)
	puts out
end

matrix_print spiral ARGV[0]