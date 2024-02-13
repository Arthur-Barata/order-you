FROM cockroachdb/cockroach

EXPOSE 26257 8080


CMD ["start-single-node","--insecure"]