# Slack Conversation Logger (AWS)
Logs conversations to s3://slack-logger/logs/

1. Build AMI
2. Create s3 bucket called slack-logger
3. Create launch configuration
4. Create auto-scaling group
5. Create application (codedeploy)
6. Install composer packages and configure slack api key
7. Create package
8. Deploy

## Clone repository with submodules
```bash
git clone --recursive https://github.com/joonaskaskisola/slack-logger-aws.git
```

## Build own ami
```bash
cd packer
packer build template.json
```
Remember to use the built AMI when creating ASG in AWS

## Installing composer packages
```bash
cd botman-slack-logger/
./composer.phar install
```

## Configuring
```bash
mv scripts/insert_configs-example scripts/insert_configs
```
Edit `SLACK_API_KEY` & `LOG_DIR` in scripts/insert_configs


## Packaging
```bash
tar -czvf /tmp/builds/SlackApp.tar.gz .
```
