# Ombi APT repo

## Master

```bash
curl -sSL https://apt.ombi.app/pub.key | sudo apt-key add -
echo "deb https://apt.ombi.app/master jessie main" | sudo tee /etc/apt/sources.list.d/ombi.list
```

## Develop (Currently v4 beta)

```bash
curl -sSL https://apt.ombi.app/pub.key | sudo apt-key add -
echo "deb https://apt.ombi.app/develop jessie main" | sudo tee /etc/apt/sources.list.d/ombi.list
```
