def fromRoman(romanNumber)
    if /[[:lower:]]/.match(romanNumber)
        raise(TypeError)
    end
    r = romanNumber.clone
    n = 0
    counter = 0
    until r.empty? do
        case
        when r.start_with?('M')  then v = 1000; len = 1
        when r.start_with?('CM') then v = 900;  len = 2
        when r.start_with?('D')  then v = 500;  len = 1
        when r.start_with?('CD') then v = 400;  len = 2
        when r.start_with?('C')  then v = 100;  len = 1
        when r.start_with?('XC') then v = 90;   len = 2
        when r.start_with?('L')  then v = 50;   len = 1
        when r.start_with?('XL') then v = 40;   len = 2
        when r.start_with?('X')  then v = 10;   len = 1
        when r.start_with?('IX') then v = 9;    len = 2
        when r.start_with?('V')  then v = 5;    len = 1
        when r.start_with?('IV') then v = 4;    len = 2
        when r.start_with?('I')  then v = 1;    len = 1
        else
            raise ArgumentError.new("invalid roman numerals: " + romanNumber)
        end
        n += v
        counter +=len
        r.slice!(0,len)
    end
    return n
end

Symbols = { 1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M' }
Subtractors = [ [1000, 100], [500, 100], [100, 10], [50, 10], [10, 1], [5, 1], [1, 0] ]

def toRoman(arabicNumber)
    # Replace the following line with the actual code!

    if arabicNumber <= 0
        raise(RangeError)
    end
    if arabicNumber >= 4000
        raise(RangeError)
    end
    if  Symbols.has_key?(arabicNumber)
        return Symbols[arabicNumber]
    end
    Subtractors.each do |cutPoint, subtractor|
        if arabicNumber > cutPoint
            return toRoman(cutPoint) + toRoman(arabicNumber - cutPoint)
        end
        if arabicNumber >= cutPoint - subtractor and arabicNumber<cutPoint
            return toRoman(subtractor) + toRoman(arabicNumber + subtractor)
        end
    end

end
