# Get vagrant-digitalocean SSL working happily, as er instructions available
# here:
# 
# https://github.com/smdahlen/vagrant-digitalocean/blob/c1b75bc236b88b24dacf41add2f02cb5aa86bd6b/README.md#install
#
export SSL_CERT_FILE=$(brew --prefix curl-ca-bundle)/share/ca-bundle.crt
