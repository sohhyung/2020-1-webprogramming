#beverage array 생성 [재고, 가격]
coke_arr = Array[5, 900]
sprite_arr = Array[5, 700]
coffee_arr = Array[5, 500]
tea_arr = Array[5,500]


total_income = 0

#beverage hash 생성
beverage_hash = Hash.new
beverage_hash["coke"] = coke_arr
beverage_hash["sprite"] = sprite_arr
beverage_hash["coffee"] = coffee_arr
beverage_hash["tea"] = tea_arr

#장부 파일 생성
account_file = File.new("account_book.txt", "w+")
account_file.puts "음료수 판매 기록"
account_file.close

buy_whether = "init"
until buy_whether=="n"
  #초기 출력
  puts "안녕하세요. 자판기입니다.주문할 수 있는 음료수 종류와 수량은 다음과 같습니다"
  if beverage_hash["coke"][0] !=0
    puts "coke : #{beverage_hash["coke"][0]}"
  end
  if beverage_hash["sprite"][0] !=0
    puts "sprite : #{beverage_hash["sprite"][0]}"
  end
  if beverage_hash["coffee"][0] !=0
    puts "coffee : #{beverage_hash["coffee"][0]}"
  end
  if beverage_hash["tea"][0] !=0
    puts "tea : #{beverage_hash["tea"][0]}"
  end



  #재고 채워넣기
  if beverage_hash["coke"][0] ==0
    beverage_hash["coke"][0] =5
  end
  if beverage_hash["sprite"][0] ==0
    beverage_hash["sprite"][0] =5
  end
  if beverage_hash["coffee"][0] ==0
    beverage_hash["coffee"][0] =5
  end
  if beverage_hash["tea"][0] ==0
    beverage_hash["tea"][0] =5
  end



  #주문 여부
  puts"음료를 주문하시겠습니까? 주문하시려면 y, 주문하지 않으시려면 n를 입력해주세요"
  buy_whether = gets.chomp
  #주문 안할 때 출력
  if buy_whether =="n"
    puts "자판기를 종료합니다."
    break
  end
  #사용자 주문 입력
  puts "어떤 음료수를 주문하시겠습니까. 소문자로 입력해주세요!"
  buy_beverage = gets.chomp
  puts "몇 개를 주문하시겠습니까?"
  buy_num = gets.chomp.to_i
  #숫자 잘못 입력
  if buy_num > beverage_hash[buy_beverage][0]
    puts "구매 가능 수량을 초과하였습니다. #{beverage_hash[buy_beverage][0]}개까지만 주문하실 수 있습니다."
  end
  if buy_num<=0
    puts "구매는 1개 이상만 가능합니다."
  end
  #재고에서 제거
  beverage_hash[buy_beverage][0] -= buy_num
  if beverage_hash[buy_beverage][0] ==0
    total_income += beverage_hash[buy_beverage][1] *5
    puts "total income : #{total_income}"
    account_file = File.new("account_book.txt", "a+")
    account_file.puts "#{buy_beverage} 5개 판매 완료. total income #{total_income}"
    account_file.close
  end










end


#
