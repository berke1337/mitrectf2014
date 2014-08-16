require 'zip/zip'

IO.foreach('zipoff') do |line|
	offset=line.split(':')[0].to_i
	begin
		zio=Zip::ZipInputStream.new("f300b.img",offset)
		if zio then
			entry=zio.get_next_entry
			puts "#{offset} #{entry.name}" if entry and entry.name=~/contract/
			zio.close
		end
	rescue
	end
end
