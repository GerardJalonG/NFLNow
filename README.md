# NFL Now

Aplicacion iOS desarrollada con SwiftUI para consultar informacion de equipos, jugadores y estadisticas de la NFL desde una interfaz clara y modular.

## Descripcion

NFL Now permite:

- Crear y editar equipos seguidos
- Anadir jugadores personalizados
- Consultar estadisticas detalladas por jugador
- Visualizar rendimientos individuales y colectivos
- Revisar resúmenes de partido y puntuaciones por cuarto
- Mantener datos guardados en local con `UserDefaults`

La app esta construida completamente en SwiftUI y sigue una organizacion modular para facilitar mantenimiento y crecimiento.

## Arquitectura

El proyecto sigue el patron MVVM (`Model-View-ViewModel`) con una separacion clara entre presentacion, logica de negocio y modelos de datos.

```text
core/       storage/ | errors/ | constants/
view/       Calendar/ | Home/ | Profile/ | ViewTeam/ | ViewGameSummary/ | ViewPlayer/ | SharedComponents/
viewmodel/  TeamStore | PlayerStore | GameSummaryViewModel | TeamViewModel | RosterViewModel | ScoreBoardViewModel
services/   NFLService | APIError
model/      CreatedPlayer | PlayerListItem | TopPerformances | PlayerStats | ScoreBoard | GameSummary | Team | Roster
```

## Persistencia local

La persistencia se implementa con `UserDefaults` a traves de `DefaultStorage`, una capa dedicada que evita acoplar vistas y view models al almacenamiento.

Incluye:

- Guardado de equipos seguidos
- Guardado de jugadores creados por el usuario
- Serializacion segura con `Codable`, `JSONEncoder` y `JSONDecoder`

## Regla de negocio destacada

`TeamStore` gestiona el estado de los equipos seguidos y aplica un limite maximo de 5 equipos simultaneos. Esta restriccion demuestra la separacion entre logica de negocio, persistencia y capa visual.

## Capturas del simulador

Este repositorio incluye un workflow de GitHub Actions que puede compilar la app en un runner macOS y generar automaticamente una captura del simulador para la pantalla inicial:

```text
.github/workflows/ios-simulator-screenshot.yml
scripts/ci/capture_ios_screenshot.sh
docs/screenshots/home.png
```

Despues de ejecutar manualmente el workflow `iOS Simulator Screenshot` desde la pestaña `Actions`, la imagen quedara guardada en el repositorio y podra mostrarse aqui:

![Home](docs/screenshots/home.png)

Si mas adelante quieres ampliar la galeria, la estructura recomendada es:

```text
docs/screenshots/home.png
docs/screenshots/calendar.png
docs/screenshots/profile.png
docs/screenshots/player-detail.png
```

## Recursos adicionales

[Recursos Usados - NFLNow.pdf](https://github.com/user-attachments/files/25337196/Recursos.Usados.-.NFLNow.pdf)
