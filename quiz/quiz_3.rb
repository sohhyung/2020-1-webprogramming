ans_array = Array.new
ball_count = 0
strike_count = 0
try_no = 0
try_max = 10

puts ("숫자 야구 게임에 오신걸 환영합니다. 10번의 시도 안에 정답을 맞추셔야합니다.")




i=0
while i <4
  tmp = rand(9)
  if ans_array.include?(tmp) ==false
    ans_array[i] = tmp
    i = i + 1
  else
    tmp = rand(9)
  end
end


start_time = Time.now

while try_no<try_max
  try_no +=1
  puts("0~9까지의 숫자 모두 다르게 4개를 입력해주세요!")
  player = gets.chomp

  if (player[0]==player[1] || player[0]==player[2] || player[0]==player[3] || player[1]==player[2] || player[1]==player[3]|| player[3]==player[4])
    puts ("4개의 숫자가 모두 달라야합니다. 한번 더 기회를 드릴게요. 다시 입력해주세요!")
    player = gets.chomp
  end

  puts player


  for j in 0..3
    for k in 0..3
      if (ans_array[j] == player[k].to_i) && j==k
        strike_count +=1
      end
      if (ans_array[j] == player[k].to_i) && j!=k
        ball_count +=1
      end
    end
  end

  puts ("#{try_no}번째 시도 #{strike_count}S#{ball_count}B")

  if strike_count==4
    end_time = Time.now
    puts ("정답을 맞추셨습니다.")
    puts try_no
    try_time = end_time-start_time
    puts("당신의 이름을 입력해주세요")
    name = gets.chomp
    file = File.new("scoreboard","a+")
    file.puts "[#{name}/#{try_no}/#{try_time}sec]"
    file.close
    break
  end
  if try_no ==10
    puts "너무 많이 틀리셨네요. 다시 시도해주세요!"
    puts "정답은 #{ans_array}였습니다"
  end
  strike_count=0
  ball_count=0

end

