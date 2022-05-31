FROM clojure:openjdk-8-slim-buster AS base_image

COPY . .
CMD ["echo Hello"]
