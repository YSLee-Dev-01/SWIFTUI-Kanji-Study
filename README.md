# SwiftUI + TCA를 활용한 한자 공부 앱 
- 개발기간: 2025.08.18 ~ 2025.09.02
- MIT 라이센스 한자 사용 (하단 명기)

| 홈 | 히라가나 | 가타카나 |
|------|-----------|-----------|
| <img src="https://github.com/user-attachments/assets/1d790466-56a1-4d58-a68c-844834961d87" height="350" /> | <img src="https://github.com/user-attachments/assets/a0138cae-11e8-42f5-9255-603da5a30823" height="350" /> | <img src="https://github.com/user-attachments/assets/a227f5e2-34ff-4c1f-9cc0-14eb6b1c1dbc" height="350" /> |

| 한자 | 한자 상세 | 검색 |
|------|------|------|
| <img src="https://github.com/user-attachments/assets/bd3faeb0-82ea-4fa1-9f3f-83e4ea0ab8aa" height="350" /> | <img src="https://github.com/user-attachments/assets/3f241bc9-0fe7-475a-9111-086cbdffbf23" height="350" /> | <img src="https://github.com/user-attachments/assets/e28aff8c-e80a-44fe-9e43-b30f8eb3c192" height="350" /> |


<br> 

## 📋 주요 기능 
### 홈 
- 즐겨찾기 한 단어를 볼 수 있고, 추천 한자를 사용자에게 제공합니다.
- 히라가나, 가타카나, 한자, 검색화면으로 이동할 수 있는 버튼을 제공합니다.

### 히라가나, 가타카나 
- 일본어의 오십음도에 해당하는 가나(카나)를 표시합니다.
- 가나를 선택하면 해당 가나에 대한 한국어 발음, 영어 발음을 확인할 수 있습니다.
  
### 한자 
- JLPT 레벨별로 분류된 한자를 제공합니다. 
- 분류된 한자를 Step으로 한번 더 나누어 사용자에게 10개씩 제공합니다.
- 상세 페이지에서는 한자의 음독, 훈독, 설명(영어)를 제공합니다.
  
### 검색 
- 한자나 한자의 음독, 훈독으로 검색할 수 있는 기능을 제공합니다. 
- 한자를 선택하면 한자 상세페이지로 이동할 수 있습니다.

<br>

## 🛠 기술 스택 & 아키텍처
- SwiftUI, UIKit(SwiftUI에서 지원하지 않는 부분을 컨트롤 하기 위함)
- TCA(composable-architecture)

<br>
  
## 💡 제작 포인트
### 디자인 (<a href = "https://github.com/YSLee-Dev-01/SWIFTUI-MOVIE/">영화 조회 앱</a>과 동일)
- Apple의 HIG를 준수하며 디자인 및 개발하였습니다.
- Apple의 기본 앱과 유사한 컬러와 디자인을 사용하여 사용자에게 거부감이 없게 설계하였습니다.
- 다양한 애니메이션을 활용하여, 검색하거나 단어를 선택할 때 자연스럽게 동작하도록 개발하였습니다.

### 개발
- Shared 프로퍼티 래퍼 사용하여 앱 전역에서 즐겨찾기 된 단어를 일괄성 있게 저장, 조회했습니다.
- StatckState 기반 화면 전환 시 Delegate 패턴을 사용하여 책임을 분리하고 의도를 명확히 했습니다. (일부)
- SwiftUI의 Group{}, .transition{} 등을 응용하여 다양한 애니메이션을 구현하고, 상태에 따라 유동적으로 표현할 수 있게 했습니다.
- TCA의 중요 포인트인 단방향 데이터 흐름을 지키면서 개발했습니다.

<br>

## 🧐 프로젝트 후기/회고
### @Shared
- 즐겨찾기 된 단어는 홈, 검색, 상세 화면 등 다양한 화면에서 접근해야 했습니다.
- 기존 방식은 최상위 부모가 즐겨찾기 된 단어를 가지고 있거나 싱글톤 Manager를 통해 관리했어야 했는데,<br>이 방식은 보일러플레이트 코드가 발생하고 각 화면 간 데이터 동기화가 제대로 되지 않을 수 있다는 문제가 있었습니다.
- 이를 개선하기 위해 @Shared 프로퍼티 래퍼를 사용하여 즐겨찾기 된 단어를 전역으로 공유할 수 있게 했습니다.
- 이를 통해 보일러플레이트 코드가 줄고, 각 화면 간 데이터 동기화 문제를 해결할 수 있었습니다.

### StackState + Delegate
- TCA의 StackState 기반의 Navigation을 사용하다 보니 부모가 자식의 모든 정보를 알고 있어야만 화면 전환을 할 수 있는 한계가 있었습니다.
- 이 때 Delegate 패턴을 학습, 응용하여 데이터 준비는 자식이 하고, 부모는 단순히 화면 전환만 담당하는 식으로 개발했습니다.
- 이를 통해 부모와 자식간의 책임이 분리되고, 코드 결합도가 낮아졌습니다.

<br>

## 📖 License
### 본 앱에서 사용된 한자 데이터는 아래의 데이터를 사용했습니다. (MIT License)
- https://github.com/AnchorI/jlpt-kanji-dictionary
- https://github.com/davidluzgouveia/kanji-data
