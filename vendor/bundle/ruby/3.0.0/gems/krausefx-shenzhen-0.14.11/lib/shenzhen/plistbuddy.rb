module Shenzhen::PlistBuddy
  class << self
    def print(file, key)
      output = `/usr/libexec/PlistBuddy -c "Print :#{key}" "#{file}" 2> /dev/null`

      !output || output.empty? || /Does Not Exist/ === output ? nil : output.strip
    end
    
    def set(file, key, value)
      output = `/usr/libexec/PlistBuddy -c "Set #{key} #{value}" "#{file}" 2>&1`
      output == "" ? value : nil
    end
  end
end
