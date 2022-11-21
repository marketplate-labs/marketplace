# Depenedcies
FROM node:gallium-alpine as dependencies

RUN apk update
RUN apk add git

WORKDIR /marketplace

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

# Builder
FROM node:gallium-alpine as builder

WORKDIR /marketplace

COPY . .
COPY --from=dependencies /marketplace/node_modules ./node_modules

ARG NEXT_PUBLIC_CHAIN_ID
ENV NEXT_PUBLIC_CHAIN_ID=$NEXT_PUBLIC_CHAIN_ID

ARG NEXT_PUBLIC_RESERVOIR_API_BASE
ENV NEXT_PUBLIC_RESERVOIR_API_BASE=$NEXT_PUBLIC_RESERVOIR_API_BASE

ARG NEXT_PUBLIC_ALCHEMY_ID
ENV NEXT_PUBLIC_ALCHEMY_ID=$NEXT_PUBLIC_ALCHEMY_ID

RUN yarn build

CMD yarn start
