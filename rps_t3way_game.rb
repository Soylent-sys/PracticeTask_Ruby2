# クラス定義

# じゃんけんclass
class Rps
  def rps_game
    rps_match_end = false # じゃんけんが行われたかどうかの判定値
    rps_rematch = false   # 相子かどうかの判定値
    rps_game_end = false  # じゃんけん勝負の終了判定値
    @game_break = false   # 中断を選択したかどうかの判定値
    
    while rps_game_end === false
      while rps_match_end === false  # 1から4以外の数字を入力した場合のループ制御
        puts "-------------------------------"
        if rps_rematch === false
          puts "「じゃんけん…」"
        else
          puts "「あいこで…」"
        end
        puts "出す手を選んでください"
        puts "1. グー ｜２． チョキ ｜３．パー ｜4. 中断する"
        
        @rps_num = gets.to_i
        
        if @rps_num === 1 || @rps_num === 2 || @rps_num === 3
          rps_match_end = true
        elsif @rps_num === 4
          puts "中断を選択したのでゲームを終了します"
          @game_break = true
          return
        else
          puts "1から4の数字を入力してください"
        end
      end
      
      user_rps_text = ""
      @rps_result_win = nil
      
      case @rps_num
      when 1 then
        user_rps_text = "グー"
      when 2 then
        user_rps_text = "チョキ"
      when 3 then
        user_rps_text = "パー"
      end
      
      cpu_rps_num = Random.rand(1..3)  # 対戦相手の手をランダムで決定
      
      cpu_rps_text = ""
      
      case cpu_rps_num
      when 1 then
        cpu_rps_text = "グー"
      when 2 then
        cpu_rps_text = "チョキ"
      when 3 then
        cpu_rps_text = "パー"
      end
      
      # 勝敗の判定
      if    @rps_num === 1 && cpu_rps_num === 2
        @rps_result_win = true
      elsif @rps_num === 2 && cpu_rps_num === 3
        @rps_result_win = true
      elsif @rps_num === 3 && cpu_rps_num === 1
        @rps_result_win = true
      elsif @rps_num === cpu_rps_num
        # 相子なら何もしない
      else
        @rps_result_win = false
      end
      
      puts "-------------------------------"
      
      if   rps_rematch === false
        puts "「ポン！」"
      else rps_rematch === true
        puts "「しょ！」"
      end
      
      puts "あなたの手：　#{user_rps_text}"
      puts "相手の手　：　#{cpu_rps_text}"
      
      # 勝負がついた場合はメソッドを終了
      case @rps_result_win
      when true then
        puts "あなたの勝ちです！"
        rps_game_end = true
        
      when false then
        puts "あなたの負けです"
        rps_game_end = true
        
      else
        puts "引き分けです"
        rps_rematch = true # 相子だった場合
        rps_match_end = false
        
      end
    end
  end
  
end

# あっち向いてホイclass
class T3way  # turn the this way の略
  def initialize(rps_result)
    @rps_result_win = rps_result
  end
  
  def t3way_game
    puts "-------------------------------"
    puts "「あっち向いて…」"
    
    @t3way_end = false  # 勝敗がついたかどうかの判定値
    way_select = false  # 方向（1~4）を選んだかどうかの判定値
    
    # あっち向いてホイの進行テキスト格納変数
    way_select_text = ""
    user_move_text = ""
    cpu_move_text = ""
    battle_end_text = ""
    keep_on_battle_text = ""
    
    # あっち向いてホイの勝敗で進行テキストを分岐させる
    if @rps_result_win === true
      way_select_text = "指をさす方向を選んでください"
      user_move_text = "あなたの指の向き：　"
      cpu_move_text = "相手の首の向き　：　"
      battle_end_text = "おめでとうございます！！あなたの勝ちです！"
      keep_on_battle_text = "残念！じゃんけん勝負に戻ります"
    else
      way_select_text = "顔を向ける方向を選んでください"
      user_move_text = "あなたの首の向き：　"
      cpu_move_text = "相手の指の向き　：　"
      battle_end_text = "残念！あなたの負けです。次は勝てるといいですね"
      keep_on_battle_text = "相手の指を避けました！じゃんけん勝負に戻ります"
    end
    
    # プレイヤー側と相手側の方向選択
    while way_select === false  # 1~4以外を入力した場合の制御
      puts way_select_text
      puts "1. ↑ ｜２． ↓ ｜３．← ｜4. →"
      
      way_num = gets.to_i
      
      if way_num === 1 || way_num === 2 || way_num === 3 || way_num === 4
        way_select = true
      else
        puts "1から4の数字を入力してください"
        puts "-------------------------------"
      end
    end
    
    user_way_text = ""
    
    case way_num
    when 1 then
      user_way_text = "↑"
    when 2 then
      user_way_text = "↓"
    when 3 then
      user_way_text = "←"
    when 4 then
      user_way_text = "→"
    end
    
    cpu_way_num = Random.rand(1..4)
    
    cpu_way_text = ""
    
    case cpu_way_num
    when 1 then
      cpu_way_text = "↑"
    when 2 then
      cpu_way_text = "↓"
    when 3 then
      cpu_way_text = "←"
    when 4 then
      cpu_way_text = "→"
    end
    
    puts "-------------------------------"
    puts "「ホイ！」"
    puts user_move_text + user_way_text
    puts cpu_move_text + cpu_way_text
    
    # 勝敗の判定とその後の動き
    if way_num === cpu_way_num
      puts battle_end_text
      @t3way_end = true
    else
      puts keep_on_battle_text
    end
    
  end
end



# 以下アプリ起動後の動作

game_end = false # アプリ全体の終了判定

puts "あっち向いてホイ付きじゃんけんアプリ"
puts "ゲームを開始します"

while game_end === false
  # じゃんけんフェーズ
  game = Rps.new
  game.rps_game
  
  # じゃんけんでゲーム中断を選んだ場合はインスタンス内の
  # @game_breakがtrueになっている
  if game.instance_variable_get(:@game_break) === true
    game_end = true
  end
    
  # あっち向いてホイフェーズ
  # じゃんけんでゲームを中断していた場合、あっち向いてホイフェーズをスキップ
  if game_end === false
    # T3wayをnewする際の引数でじゃんけんの勝敗（gameのインスタンス変数）を取得
    # 引数に応じてnext_game内のインスタンスメソッドの処理を分岐させる
    next_game = T3way.new(game.instance_variable_get(:@rps_result_win))
    next_game.t3way_game
  
    # あっち向いてホイで勝敗が決まるとゲームが終了する
    # 勝負がつかなかった場合はじゃんけんフェーズに戻って再戦
    if next_game.instance_variable_get(:@t3way_end) === true
      game_end = true
    end
  end
end

puts "-------------------------------"
puts "あっち向いてホイ付きじゃんけんアプリを終了します。おつかれさまでした！"
puts ""
puts "すべての処理終了"
