# envman
A tool to quickly manage PCF/Mongo Ops Manager credentials
## Prerequisites
- GNU/Linux
- `bash` v4.2+
- `yq`
## Usage
1. Make this script available from PATH or create an alias:
```
alias envman=path/to/envman
```
2. Run it from project directory against your creds.yml:
```
envman ci/creds.yml
```
3. Follow the instructions
