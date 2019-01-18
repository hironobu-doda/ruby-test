class Player
  def hand
    #puts janken.pon
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "0〜2の数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    puts ""
    # to_fメソッドは小数点以下を入れたいときに使う
    player_hands = gets.to_f
    # 0ではない→1ではない→2ではない
    #return player_handsで外に出す
    return player_hands if player_hands == 0 || player_hands == 1 || player_hands == 2
      # 繰り返し処理
    hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hands = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    # puts "プレイヤーの数字は#{player_hand}"
    # puts "敵の数字は#{enemy_hand}"

    # 敵の手
    if enemy_hand == 0
      enemy_hand_result = "グー"
    elsif enemy_hand == 1
      enemy_hand_result = "チョキ"
    else
      enemy_hand_result = "パー"
    end

    # じゃんけん結果
    battle = (player_hand - enemy_hand + 3) % 3
    if battle == 2
      battle_result = "あなたの勝ちです。"
    elsif battle == 1
      battle_result = "あなたの負けです。"
    else
      battle_result = "あいこです。再試合してください。"
    end

    # puts "バトルの結果の数字は#{battle}"

    # 結果発表
    puts "相手の手は#{enemy_hand_result}です。#{battle_result}"

    # 引き分けの場合
    if battle == 0
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new

      # 下記の記述で、ジャンケンメソッドが起動される
      janken.pon(player.hand, enemy.hand)
    end

  end


end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
# player.handにはplayerクラスのhandメソッドが入っている
# enemy.handにはEnemyクラスのhandメソッドが入っている
# janken.ponの引数（インスタンス変数）がponメソッドの引数（インスタンス変数）に入る
janken.pon(player.hand, enemy.hand)

# 引き分けの場合
# player.hand(janken.pon)


# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
