
def countdown(shellcode)
    shellcode_array = shellcode.split('\x')
    no_authorized = ["00", "FF", "0D", "0A", "ff", "0d", "0a"]
    final_rez = []
    shellcode_array.each do |bytes|
       
        no_authorized.each do |no_auth|
            if bytes == no_auth
                shellcode_array.delete(bytes)
            end
        end
    end

    shellcode_array.each do |octet|
        if octet != ""
            final_rez << "\\x#{octet}"
        end

    end
    return final_rez.join

end

puts countdown('\xeb\x1e\x5e\x48\x31\xc0\xb0\x01\x48\x89\xc7\x48\x89\xfa\x48\x83\xc2\x0e\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31\xff\x0f\x05\xe8\xdd\xff\xff\xff\x48\x65\x6c\x6c\x6f\x2c\x20\x77\x6f\x72\x6c\x64\x21\x0a')