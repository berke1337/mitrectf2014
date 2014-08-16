a=IO.read('a9b1c6694f385f27c6929cdbadf9794e-sloth.png').force_encoding('binary')
i=0
while n=a.index(/\x89PNG/,i+1) do
	IO.write("x#{i}.png",a[i...n])
	i=n
end
IO.write("x#{i}.png",a[i...-1])
