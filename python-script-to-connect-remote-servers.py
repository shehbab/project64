import paramiko   
host = ['XX.XX.XX.XX', 'XX.XX.XX.XX',]
username = 'username'   
password = 'password'   
   
# connect to server   
for hostname in host:
    con = paramiko.SSHClient()   
    con.load_system_host_keys()   
    con.connect(hostname, username=username, password=password)   
   # run the command   
    stdin, stdout, stderr = con.exec_command('hostname')   
   # process the output   
    print(stdout.readline().strip())
