# Stage 1: Build the Blazor WASM app
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy solution and project files first so Docker can cache the restore layer
COPY RandomOperationNameGenerator2.sln .
COPY RandomOperationNameGenerator2.csproj .

RUN dotnet restore

# Copy remaining source and publish
COPY . .

RUN dotnet publish RandomOperationNameGenerator2.csproj \
    -c Release \
    --no-restore \
    -o /app/publish

# Stage 2: Serve the static output with nginx
FROM nginx:alpine AS runtime
COPY --from=build /app/publish/wwwroot /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
