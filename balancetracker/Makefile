# Docker data
IMAGE_NAME:=balancetracker-service

# AWS data
REGION=us-east-1
ACCOUNT_ID=487359670077

ECR_REPOSITORY=$(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(IMAGE_NAME)

deploy:
	$(MAKE) login
	$(MAKE) build_image
	$(MAKE) push_image

login:
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ECR_REPOSITORY)

build_image:
	docker build --platform linux/amd64 -t $(IMAGE_NAME):latest .
	docker tag $(IMAGE_NAME):latest $(ECR_REPOSITORY):latest

push_image:
	docker push $(ECR_REPOSITORY):latest
