class sshd {
	package {"openssh-server" :
		ensure =>"installed" ,
		allowcdrom => "true" , 
		}

	service {"ssh" :
		ensure => "running" ,
		require => Package['openssh-server']  
		}		

	augeas { "change-sshd" :
		context => "/files/etc/ssh/sshd_config",
		changes => ['set Port 2002'] ,
		notify => Service['ssh'] ,
		require => Package['openssh-server']  
		}

}
