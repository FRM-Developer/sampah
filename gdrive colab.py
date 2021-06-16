#@title **Google Drive Mount**
#@markdown Google Drive used as Persistance HDD for files.<br>
#@markdown Mounted at `user` Home directory inside drive folder
#@markdown (If `username` variable not defined then use root as default).

def MountGDrive():
    from google.colab import drive

    ! runuser -l $user -c "yes | python3 -m pip install --user google-colab"  > /dev/null 2>&1

    mount = """from os import environ as env
from google.colab import drive

env['CLOUDSDK_CONFIG']  = '/content/.config'
drive.mount('{}')""".format(mountpoint)

    with open('/content/mount.py', 'w') as script:
        script.write(mount)

    ! runuser -l $user -c "python3 /content/mount.py"

try:
    if username:
        mountpoint = "/home/"+username+"/drive"
        user = username
except NameError:
    print("username variable not found, mounting at `/content/drive' using `root'")
    mountpoint = '/content/drive'
    user = 'root'

MountGDrive()