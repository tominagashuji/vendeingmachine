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
      puts "飲み物を購入できるか確認するよ！！"
      puts "投入金額は#{slot_money}円です"
      puts drink
      
      uriage_kingaku = 0
      # コーラ販売可否チェック
      if slot_money >= drink[:price] && drink[:stock] > 0
      # 購入成功
        puts "買えます！"
        # 投入金額からコーラ代を引く
        slot_money = slot_money - drink[:price]
      # 投入金額からコーラ代を引く
        drink[:stock] -= 1
      # コーラの販売金額を @uriage_kingaku に加算
        self.sale(drink)
      # コーラの販売金額を @uriage_kingaku に加算
        self.refund(slot_money)
      else
        puts "買えません！"
        self.refund(slot_money)
      end

      puts "現在自販機に入っている金額は#{slot_money}円です"
      puts "#{drink[:name]} の在庫は #{drink[:stock]}本です"
      return [slot_money,drink]
    end

    # 売り上げ金額の表示
    def sale(drink)
      uriage_kingaku = 0
      uriage_kingaku += drink[:price]
      puts "売り上げ金額は #{uriage_kingaku} です!!"
    end

    # お釣り操作
    def refund(slot_money)
      puts "お釣りは #{slot_money} です!!"
    end

  end

  class Money
    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      slot_money = gets.to_i
      return slot_money
    end
  end


vm = VendingMachine.new
dr = Drink.new
pc = Purchase.new
mn = Money.new

puts "お金入れて！！"
pc.check(mn.current_slot_money,dr.current_slot_drink)

