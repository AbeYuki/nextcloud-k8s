VERSION = 1.0.0

define RELEASE_NOTES
## 構成
- nextcloud-apache
- mariadb
- redis
- cron

endef

export RELEASE_NOTES

tag:
	git tag $(VERSION)
	git push origin $(VERSION)

release: tag
	echo "$$RELEASE_NOTES" | gh release create $(VERSION) -t "$(VERSION)" -F -

pre-release: tag
	echo "$$RELEASE_NOTES" | gh release create -p $(VERSION) -t "$(VERSION)" -F -

