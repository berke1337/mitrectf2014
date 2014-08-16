res=[
	"[\\d\\w]{40}",
	"[\\d]+[\\w][\\d]+[\\d][\\d]+[\\w][\\d]+[\\w]+[\\d]+[\\w]+[\\d]+[\\w]+[\\d]+[\\w]+[\\d]+",
	"[4-6][4-6][d-f][7-9][7-9][7-9][1-3][d-f][4-6][7-9][d-f][4-6][7-9][1-3][d-f][a-c][d-f][4-6][0-5]+[d-f][1-3][7-9][a-c][4-6][4-6][0-5]+[7-9][7-9][1-3][0-5]+[a-c][a-c][d-f][d-f][a-c][d-f][4-6][1-3][4-6]",
	"[246][246][ace][789][789][789][135][ace][135][789][ace][135][789][135][bdf][ace][ace][135][0-5]+[0-1]{0,5}[bdf][135][789][bdf][246][135][0-5]+[0-1]{0,5}[789][789][135][0-5]+[0-1]{0,5}[ace][ace][bdf][bdf][bdf][bdf][135][246][246]",
	"[34cd][56ef][56ef][789][789][789][34cd][56ef][56ef][789][56ef][56ef][789][12ab][34cd][34cd][56ef][56ef][0-5]+[34cd][34cd][789][12ab][34cd][56ef][0-5]+[789][789][12ab][0-5]+[34cd][34cd][34cd][34cd][12ab][56ef][56ef][12ab][56ef]",
	"[46d][rfefhr]?[46d][rfefhr]?[13e][rfefhr]?[89ba][rfefhr]?[89ba][rfefhr]?[89ba][rfefhr]?[13e][rfefhr]?[13e][rfefhr]?[57c][rfefhr]?[89ba][rfefhr]?[13e][rfefhr]?[57c][rfefhr]?[89ba][rfefhr]?[13e][rfefhr]?[46d][rfefhr]?[57c][rfefhr]?[13e][rfefhr]?[57c][rfefhr]?[02f][rfefhr]?[46d][rfefhr]?[13e][rfefhr]?[89ba][rfefhr]?[89ba][rfefhr]?[46d][rfefhr]?[57c][rfefhr]?[02f][rfefhr]?[02f][rfefhr]?[89ba][rfefhr]?[89ba][rfefhr]?[13e][rfefhr]?[02f][rfefhr]?[57c][rfefhr]?[57c][rfefhr]?[46d][rfefhr]?[46d][rfefhr]?[89ba][rfefhr]?[02f][rfefhr]?[57c][rfefhr]?[02f][rfefhr]?[46d][rfefhr]?",
	"[48c][gobble]?[26a][gobble]?[0def][gobble]?[48c][gobble]?[159][gobble]?[48c][gobble]?[37b][gobble]?[0def][gobble]?[159][gobble]?[48c][gobble]?[0def][gobble]?[159][gobble]?[159][gobble]?[159][gobble]?[0def][gobble]?[48c][gobble]?[0def][gobble]?[159][gobble]?[0def][gobble]?[0def][gobble]?[37b][gobble]?[48c][gobble]?[37b][gobble]?[48c][gobble]?[159][gobble]?[0def][gobble]?[0def][gobble]?[48c][gobble]?[159][gobble]?[159][gobble]?[0def][gobble]?[48c][gobble]?[48c][gobble]?[0def][gobble]?[0def][gobble]?[37b][gobble]?[0def][gobble]?[159][gobble]?[26a][gobble]?[26a][gobble]?",
	"[1-9][1-9][a-f][1-9][1-9][1-9][1-9][a-f][1-9][1-9][a-f][1-9][1-9][1-9][a-f][a-f][a-f][1-9][0ace][a-f][1-9][1-9][a-f][1-9][1-9][0ace][0ace][1-9][1-9][1-9][0ace][a-f][a-f][a-f][a-f][a-f][a-f][1-9][1-9][1-9]"
]
valid_chars=[("0".."9").to_a+("a".."z").to_a]*40
res[5].gsub!("[rfefhr]?","")
res[6].gsub!("[gobble]?","")
res[5..7].each do |re|
	i=0
	re.gsub(/\[([^\]]+)\]/) do
		cc=$~[1]
		if cc=~/^[^-]*$/ then
			valid_chars[i]&=cc.chars.to_a
		elsif cc=~/^(.)-(.)$/ then
			valid_chars[i]&=(($~[1].to_s)..($~[2].to_s)).to_a
		else
			puts "Error #{cc}"
			exit
		end
		i+=1
	end
end
puts valid_chars.map { |v| v[0] }*""
