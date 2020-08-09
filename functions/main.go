package functions

import (
	"context"
	"log"
	"time"
)

// AuthEvent is the payload of a Firestore Auth event.
type AuthEvent struct {
	Email    string `json:"email"`
	Metadata struct {
		CreatedAt time.Time `json:"createdAt"`
	} `json:"metadata"`
	UID string `json:"uid"`
}

func AddUser(ctx context.Context, e AuthEvent) error {
	log.Printf("Function triggered by creation or deletion of user: %q", e.UID)
	log.Printf("Created at: %v", e.Metadata.CreatedAt)
	if e.Email != "" {
		log.Printf("Email: %q", e.Email)
	}
	return nil
}