Facter.add("user_roulette") do
  confine :kernel => 'Linux'
  setcode do
    Facter::Util::Resolution.exec('cat /etc/passwd | shuf -n 1 | cut -d: -f1')
  end
end