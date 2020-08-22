FROM alpine

COPY --from=hashicorp/terraform:0.13.0 /bin/terraform /bin/terraform

RUN apk add --no-cache make curl vim

COPY terra_wrap /usr/local/bin/

WORKDIR /terraform

ENTRYPOINT ["/bin/ash"]
