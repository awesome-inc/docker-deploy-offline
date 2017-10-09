FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# build runtime image
FROM microsoft/aspnetcore:2.0

ARG GIT_COMMIT
ARG BUILD_DATE
ARG BUILD_VERSION

# TODO: deprecated, for legay ui frontend
MAINTAINER "Awesome Incremented <marcel.koertgen@gmail.com>"

# cf.: http://label-schema.org/rc1/
LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.name="myapp" \
      org.label-schema.description="An example ASP MVC Web app" \
      org.label-schema.usage="https://github.com/awesome-inc/docker-deploy-offline/blob/master/README.md" \
      org.label-schema.url="https://github.com/awesome-inc/docker-deploy-offline" \
      org.label-schema.vcs-url="https://github.com/awesome-inc/docker-deploy-offline" \
      org.label-schema.vcs-ref="${GIT_COMMIT}" \
      org.label-schema.vendor="Awesome Incremented" \
      org.label-schema.version="${BUILD_VERSION}" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -d -p 80:80 myapp"
# TODO: even more labels...

WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "myapp.dll"]
