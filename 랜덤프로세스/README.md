# 🧠 확률 기반 상태 추정 프로젝트 모음

이 저장소는 Hidden Markov Model 기반 상태 복원 실험과 Kalman Filter를 통한 위치 예측 개선 실험으로 구성되어 있습니다.  
두 프로젝트 모두 확률 기반의 동적 시스템 추정 알고리즘을 실험적으로 분석합니다.

---

## 📁 프로젝트 구성

### 1. Kalman Filter 기반 위치 예측 최적화

- **관련 파일**: `example.m`, `SimpleKalman.m`
- **목적**: 3개의 고정 앵커를 기준으로 삼각 측량 방식으로 위치 추정 → Kalman Filter를 통해 노이즈를 줄이고 정확도 향상

#### 🔁 시스템 흐름도 (Mermaid)

```mermaid
graph TD
    Motion[물체의 이동 시뮬레이션] --> Measure[Anchor 거리 측정 (노이즈 포함)]
    Measure --> Trilateration[거리 기반 위치 추정]
    Trilateration --> Kalman[SimpleKalman을 통한 예측 보정]
    Kalman --> Eval[오차 측정 및 최적 r 선택]
```

#### 📊 최적화 내용
- 1000개의 `r`(측정 오차 공분산) 값을 테스트하여 최소 MSE(mean square error)를 찾음
- Kalman 필터 적용 전/후 위치 궤적을 시각적으로 비교하여 성능 확인

---

## 🧪 학습 및 응용 포인트

- 확률 기반 시스템 모델링 (HMM, KF)
- Viterbi 알고리즘을 통한 시퀀스 복원 능력 실험
- Kalman 필터를 이용한 노이즈 제거 및 연속적인 상태 추정
- 시뮬레이션 기반 알고리즘 성능 평가

---

### 2. Hidden Markov Model + Viterbi (상태 복원 정확도 분석)

- **관련 파일**: `HMM.m`, `randomproc_viterbi.m`, `viterbi_algorithm.m`
- **목적**: HMM 기반으로 생성된 상태를 Viterbi 알고리즘으로 복원하고, 오차 확률 \( p \) 변화에 따른 복원 정확도를 비교

#### 🔁 흐름도 (Mermaid)

```mermaid
graph TD
    Gen[Generate HMM Sequence (HMM.m)]
    Gen --> Obs[Observed Sequence]
    Obs --> Decode[Viterbi Algorithm]
    Decode --> Compare[Compare to True Hidden States]
    Compare --> Eval[Compute Error Rate]
```

#### ✅ 요약 결과
- 실험 횟수: 1000회 x 10세트
- 오차 확률별 평균 복원 실패율
    - p = 0.01 → 약 0.003
    - p = 0.05 → 약 0.030
    - p = 0.10 → 약 0.096

---




