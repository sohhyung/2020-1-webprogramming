puts("숫자를 입력해주세요")
year = gets.chomp.to_i
if year %4 !=0
  puts ("#{year}년은 평년입니다.")

elsif year%100 !=0
  puts("#{year}년은 윤년입니다.")

elsif year%400 ==0
  puts("#{year}년은 윤년입니다.")
else
  puts("#{year}년은 평년입니다.")

end



