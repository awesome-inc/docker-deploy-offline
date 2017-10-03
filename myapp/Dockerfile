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

# cf.: http://label-schema.org/rc1/
LABEL org.label-schema.build-date="${BUILD_TIME_ISO8601}" \
      org.label-schema.url="https://github.com/awesome-inc/docker-deploy-offline" \
      org.label-schema.description="An example ASP MVC Web app" \
      org.label-schema.vcs-url="https://github.com/awesome-inc/docker-deploy-offline" \
      org.label-schema.vcs-ref="${GIT_COMMIT}" \
      org.label-schema.vendor="Awesome Incremented" \
      org.label-schema.version="${BUILD_SEMVER}"

WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "myapp.dll"]
