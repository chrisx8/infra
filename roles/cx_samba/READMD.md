# Ansible Role: `cx_samba`

This role installs and configures Samba for file sharing, including Apple Time Machine support and home directory shares for users.

## Role variables

| Variable                | Description                  | Required           |
| ----------------------- | ---------------------------- | ------------------ |
| `cx_samba_min_protocol` | Minimum SMB protocol version | No, default `SMB3` |
| `cx_samba_shares`       | List of shares, see below    | No                 |

`cx_samba_shares` should be a list of dicts with these attributes (all required):

- `name`: Name of the share, part of the SMB URL `smb://{host}/{name}`
- `comment`: Description, can be any non-empty string.
- `path`: Path of the local directory for the share, must be readable by Samba.
- `browsable`: Include the share when browsing `smb://{host}`, `yes` or `no`.
- `writable`: Whether the share should be writable, `yes` or `no`.
- `create_mask`: Bit-wise MASK for the UNIX modes of a file.
- `directory_mask`: Bit-wise MASK for the UNIX modes of a directory.

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

- RHEL 8 or newer, including derivatives.
