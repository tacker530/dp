# A	Frog 1	2 sec	1024 MB	提出


N = gets.chomp.to_i
h = gets.chomp.split.map(&:to_i)
h.unshift 0     # 先頭にゼロ要素を加える 
STDERR.puts "#{N} #{h}"

#   dp[]
#    1 2 3 ･･･　N
#
#   以下の大きい法をdp[i]として採用する
#   dp[i] = dp[i-1] + (hi - hi-1).abs
#   dp[i] = dp[i-2] + (hi - hi-2).abs

# N 配列 初期値0で初期化済 ★最小値をFloat::INFINITYとしないとWAになる!!!
dp = Array.new(N,Float::INFINITY)

1.upto(N) do |i|
    if i == 1 then
      dp[i] = 0
    else
      v1 =  dp[i-1] + (h[i] - h[i-1]).abs 
      v2 =  dp[i-2] + (h[i] - h[i-2]).abs
      dp[i] = [v1,v2].min
    end
   STDERR.puts "dp[#{i}] = #{dp[i]}"

end
puts "#{dp[N]}"
