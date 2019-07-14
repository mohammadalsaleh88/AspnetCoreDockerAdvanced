# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build-env

WORKDIR /generator

# Restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# Copy src
COPY . .


# test
RUN dotnet test tests/tests.csproj

# Publish
RUN dotnet publish api/api.csproj -o /publish

# Runtime Stage
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT ["dotnet", "api.dll"]

