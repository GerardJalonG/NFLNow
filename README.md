# NFL Now

Aplicación iOS desarrollada en SwiftUI que permite gestionar equipos, jugadores y estadísticas de partidos de forma estructurada y visual.  
La aplicación sigue el patrón de arquitectura MVVM (Model–View–ViewModel), garantizando una organización clara del código, separación de responsabilidades y escalabilidad.

---

## Descripción

NFL Now permite:

- Crear y editar equipos
- Añadir jugadores personalizados
- Ver estadísticas de partidos
- Visualizar rendimiento individual y colectivo
- Consultar estadísticas detalladas por jugador
- Mostrar resúmenes de partido y puntuaciones por cuarto
- Persistencia de datos con UserDefaults

La interfaz está desarrollada completamente en SwiftUI, con componentes reutilizables y diseño modular.

## Arquitectura

El proyecto está estructurado siguiendo el patrón MVVM (Model–View–ViewModel), con una separación clara entre la capa de presentación, la lógica de negocio y los modelos de datos.  
La arquitectura está organizada de forma modular por dominios funcionales, lo que facilita la escalabilidad y el mantenimiento del código.

---
## Arquitectura General (MVVM)

```
core/       | storage/ | errors/ | constants/
view/       | Calendar/ | Home/ | CreatedPlayers/ | SharedComponents/ | ViewTeam/ | Profile/ | ViewGameSummary/ | ViewPlayer/
viewmodel/  | TeamStore | PlayerStore | GameSummaryViewModel | TeamViewModel | RosterViewModel | ScoreBoardViewModel
services/   | NFLService | APIError
model/      | CreatedPlayer | PlayerListItem | TopPerformances | PlayerStats | ScoreBoard | GameSummary | Team | Roster
```

## Funcionalidad Extra: Persistencia Local y Límite de Equipos Seguidos

Como funcionalidad adicional, se implementó un sistema de persistencia local utilizando `UserDefaults`, encapsulado en una capa de almacenamiento personalizada para mantener la arquitectura limpia y desacoplada.

---

### Persistencia Local con DefaultStorage

Se creó la clase `DefaultStorage`, que actúa como capa intermedia entre la aplicación y `UserDefaults`.  
Esta clase centraliza el acceso a la persistencia local y evita que las vistas o los ViewModels dependan directamente de `UserDefaults`.

#### Características principales:

- Implementada como Singleton (`static let shared`)
- Encapsula claves mediante `DefaultsKeys`
- Soporta almacenamiento de:
  - Equipos seguidos (array de IDs)
  - Jugadores creados por el usuario (codificados en JSON)

#### Métodos implementados:

- `loadFollowingTeamIDs()`
- `saveFollowingTeamIDs(_:)`
- `loadCreatedPlayers()`
- `saveCreatedPlayers(_:)`

Para almacenar objetos personalizados (`CreatedPlayer`), se utiliza `Codable` junto con `JSONEncoder` y `JSONDecoder`, permitiendo guardar estructuras complejas en `UserDefaults` de forma segura.

Esto mantiene la capa de persistencia aislada y facilita futuras migraciones a sistemas más avanzados como CoreData o SwiftData.

---

### Gestión de Equipos Seguidos (TeamStore)

Se implementó `TeamStore` como `ObservableObject`, responsable de:

- Gestionar el estado de los equipos seguidos
- Aplicar reglas de negocio
- Sincronizar los datos con la persistencia local

#### Responsabilidades:

- Cargar los equipos guardados al iniciar la aplicación
- Añadir equipos a la lista de seguimiento
- Eliminar equipos
- Verificar si un equipo ya está siendo seguido
- Limitar el número máximo de equipos seguidos

---

### Límite de Equipos Seguidos

Como regla de negocio adicional, se estableció un límite máximo de 5 equipos seguidos simultáneamente:

```swift
private let maxTeams = 5
```

Antes de añadir un equipo, se valida:

1. Que no esté ya en la lista.
2. Que no se haya alcanzado el límite máximo.

Esto introduce una restricción funcional que mejora la experiencia de usuario y demuestra la correcta separación entre lógica de negocio y vista.

---

### Beneficios Técnicos

- Separación clara entre almacenamiento y lógica de negocio.
- Encapsulación de `UserDefaults`.
- Uso correcto de `ObservableObject` y `@Published`.
- Persistencia automática del estado al modificar los datos.
- Arquitectura preparada para escalar hacia soluciones más robustas.

---

### Valor Añadido del Extra

Esta implementación demuestra:

- Conocimiento de persistencia local en iOS.
- Correcta integración con arquitectura MVVM.
- Aplicación de reglas de negocio en el ViewModel.
- Organización modular y escalable del proyecto.

---

###Video Tour NFLNow

https://youtu.be/WH_s2Ud3caM

---

###Documentación extra 
##Recursos usados para la creación de la aplicación móvil.

[Recursos Usados - NFLNow.pdf](https://github.com/user-attachments/files/25337196/Recursos.Usados.-.NFLNow.pdf)
