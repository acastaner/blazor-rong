# STACK.md — blazor-rong

## Stack

A Blazor WebAssembly application for learning the .NET framework, which generates random operation names from adjective/noun combinations.

## Languages and runtimes

- **C#** — primary language
- **.NET 10.0** (`net10.0`) — target runtime
- **Blazor WebAssembly** on ASP.NET Core 10.0

## Skill families in scope

| Family | Why it applies here |
|---|---|
| `dotnet-blazor` | Blazor WebAssembly project with `.razor` components (`Pages/`, `Shared/`, `App.razor`) |
| `dotnet-aspnet` | Uses `Microsoft.AspNetCore.Components.WebAssembly` hosting model |
| `dotnet-msbuild` | `.csproj` / `.sln` build configuration |

### Families explicitly out of scope

- `dotnet-maui` — no mobile/desktop MAUI targets
- `dotnet-data` — no database or EF Core usage
- `dotnet-test` — no test project present

## Conventions for this project

### Build and verification commands

```bash
# Build
dotnet build

# Run (dev server with hot reload)
dotnet watch

# Publish
dotnet publish
```

No test project exists — `dotnet test` is not applicable.

### Docker

A `Dockerfile`, `docker-compose.yml`, and `nginx.conf` are present for containerized deployment. No dedicated skill family covers Docker; handle manually.

### Project layout

```
/                          # project root (flat layout — no src/ subdirectory)
  Pages/                   # Blazor page components (.razor)
  Shared/                  # Shared Blazor components
  wwwroot/                 # Static web assets
  *.cs                     # C# model files (Adjective.cs, Noun.cs, Program.cs)
  *.razor                  # Top-level Blazor files (App.razor, _Imports.razor)
  docs/                    # Project documentation and AI context
```

### Other conventions

- Run `dotnet format` before submitting any changes. This is the enforced style baseline — no manual style fixes needed beyond what it applies automatically.

## Source vs design files

- **Source:** `*.cs`, `*.razor`, `Pages/`, `Shared/`, `wwwroot/`, `Properties/`, `*.csproj`, `*.sln`
- **Design / docs:** `docs/`, `README.md`
- **Infrastructure:** `Dockerfile`, `docker-compose.yml`, `nginx.conf`

---

## When this file grows: split into `docs/ai-context/`

When `STACK.md` becomes unwieldy, split it into topic files under `docs/ai-context/` (e.g. `blazor.md`, `build.md`, `conventions.md`) and replace the body of `STACK.md` with a brief index pointing to those files. Agent pipelines that read `STACK.md` will follow the index automatically. Keep this meta-rule in whichever file acts as the root manifest.
