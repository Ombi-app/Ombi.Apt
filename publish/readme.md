# Deb publisher

Get PGP_PRIV: https://discuss.circleci.com/t/gpg-keys-as-environment-variables/28641

## cleaner.sh

`setsid sh -c 'publish/clean.sh' </dev/zero >log 2>&1`

```sh
docker build -t publish publish/
docker run -it --rm \
    -v $PWD:/source \
    -e INPUT_GPG_PRIV=... \
    -e INPUT_GPG_PASSPHRASE=... \
    publish /clean.sh
```