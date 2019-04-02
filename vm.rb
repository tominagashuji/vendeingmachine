# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# 例

# irb
# require '/Users/tominagashuuji/workspace/study/vm.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
# vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

# require '/Users/tominagashuuji/workspace/study/vm.rb'

class VendingMachine
    # ステップ０　お金の投入と払い戻しの例コード
    # ステップ１　扱えないお金の例コード
  
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    MONEY = [10, 50, 100, 500, 1000].freeze
  
    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
    end

    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      puts @slot_money
    end
  
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # 投入は複数回できる。
    def slot_money(money)
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      return "#{money}円は使えませんよ！！怒" unless MONEY.include?(money)
      # 自動販売機にお金を入れる
      @slot_money += money
      return @slot_money
    end
  
    # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    def return_money
      # 返すお金の金額を表示する
      puts @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
    end

  end

  class Drink
    DRINK = {name: "coke",price: 120,stock: 5}
  
    def initialize
      @drink = DRINK
    end

    def current_slot_drink
      puts "入っている飲み物情報"
      return @drink
    end
  end

  class Purchase
    def initialize
    end

    def check(slot_money,drink)
        puts "確認するよ！！"
        puts slot_money
        puts drink
        if slot_money >= drink[:price] && drink[:stock] > 0
            slot_money = slot_money - drink[:price]
            drink[:stock] -= 1
        end

        puts slot_money
        puts drink
        return [slot_money,drink]
    end
  end

vm = VendingMachine.new
dr = Drink.new
pc = Purchase.new

puts "投入金額は！！"
puts vm.current_slot_money
puts dr.current_slot_drink

puts "処理開始！！"
pc.check(vm.slot_money(1000),dr.current_slot_drink)
puts slot_money
puts drink
