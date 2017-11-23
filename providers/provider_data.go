package providers

import (
	"net/url"
	"regexp"
)

type ProviderData struct {
	ProviderName            string
	ClientID                string
	ClientSecret            string
	LoginURL                *url.URL
	RedeemURL               *url.URL
	ProfileURL              *url.URL
	ProtectedResource       *url.URL
	ValidateURL             *url.URL
	Scope                   string
	ApprovalPrompt          string
	OIDCAllowedGroupsRegexp *regexp.Regexp
}

func (p *ProviderData) Data() *ProviderData { return p }
