io.open("apicalldump.txt", "w")
input = textutils.serialize(peripheral.getMethods("top"))
io.write(input)