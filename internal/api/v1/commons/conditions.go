package commons

import "github.com/ClusterOperator/kubepi/internal/service/v1/common"

type SearchConditions struct {
	Conditions common.Conditions `json:"conditions"`
}
