FROM node:21

RUN if ! command -v ffmpeg >/dev/null 2>&1; then \
  apt-get update && \
  apt-get install -y ffmpeg && \
  apt-get clean; \
fi

WORKDIR /app
COPY . .
RUN yarn install
RUN mkdir -p data
CMD ["yarn", "start"]