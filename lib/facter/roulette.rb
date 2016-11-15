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
Facter.add("roulette_file_frompath") do
  confine :kernel => 'Linux'
  setcode do
    Facter::Util::Resolution.exec('ls -d -1 /bin/* /sbin/* /usr/bin/* /usr/sbin/* | shuf -n 1')
  end
end
