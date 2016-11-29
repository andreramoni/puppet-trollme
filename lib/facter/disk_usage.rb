Facter.add("disk_usage") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('df -a | perl -F\'\s+\' -nale \'next if $. == 1; print "$F[-1]=$1" if $F[-2] =~ /^(\d+)%$/\' | tr \'\n\' \',\' ')
	end
end
