# Copyright Tomer Figenblat.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM node:18.11.0-bullseye-slim

RUN apt update \
    && apt install -y git \
    && rm -rf /var/lib/apt/lists/*

RUN npm i -g \
  conventional-changelog-angular@5.0.13 \
  conventional-changelog-atom@2.0.8 \
  conventional-changelog-cli@2.1.1 \
  conventional-changelog-codemirror@2.0.8 \
  conventional-changelog-conventionalcommits@4.6.1 \
  conventional-changelog-ember@2.0.9 \
  conventional-changelog-eslint@3.0.9 \
  conventional-changelog-express@2.0.6 \
  conventional-changelog-jquery@3.0.11 \
  conventional-changelog-jshint@2.0.9 \
  conventional-recommended-bump@6.1.0 \
  git-semver-tags@4.1.1

COPY entrypoint.sh /usr/local/scripts/entrypoint.sh

RUN chmod a+x /usr/local/scripts/entrypoint.sh

WORKDIR /usr/share/repo

ENTRYPOINT ["/usr/local/scripts/entrypoint.sh"]

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.opencontainers.image.created=$BUILD_DATE \
org.opencontainers.image.authors="Tomer Figenblat <mailto:tomer.figenblat@gmail.com>" \
org.opencontainers.image.url="https://hub.docker.com/r/tomerfi/version-bumper" \
org.opencontainers.image.documentation="https://github.com/TomerFi/version-bumper" \
org.opencontainers.image.source="https://github.com/TomerFi/version-bumper" \
org.opencontainers.image.version=$VERSION \
org.opencontainers.image.revision=$VCS_REF \
org.opencontainers.image.licenses="Apache-2.0" \
org.opencontainers.image.ref.name=$VERSION \
org.opencontainers.image.title="tomerfi/version-bumper" \
org.opencontainers.image.description="Bump semver and create changelog from conventional commits"
