offset=(-0x80489e0+2528)
b=[0x80489e0,0x80489ec,0x8048a38,0x8048b00,0x8048be8,0x8048ccc,0x8048f08,0x8049148]
a=IO.read('0002dc53347013336adf249ff7dedc19-matchmaker').force_encoding('binary')
p b.map { |i| a[(i+offset)..-1].unpack('Z*')[0] }
