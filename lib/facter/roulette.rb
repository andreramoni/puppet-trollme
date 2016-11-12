Facter.add("roulette_user") do
  confine :kernel => 'Linux'
  setcode do
    Facter::Util::Resolution.exec('cat /etc/passwd | shuf -n 1 | cut -d: -f1')
  end
end
Facter.add("roulette_file") do
  confine :kernel => 'Linux'
  setcode do
    Facter::Util::Resolution.exec('locate / | shuf -n 1')
  end
end
