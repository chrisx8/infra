# Ansible Role: `cx_samba`

This role installs and configures Samba for file sharing.

## Role variables

| Variable                    | Description                          | Required |
| --------------------------- | ------------------------------------ | -------- |
| `cx_samba_homedir_override` | Optional override for home directory | No       |
| `cx_samba_shares`           | List of additional share, see below  | No       |

`cx_samba_shares` should be a list of dicts with the following attributes (`*` = required):

- `name`\*: Name of the share, part of the SMB URL `smb://{host}/{name}`
- `path`\*: Path of the local directory to be shared, must be readable by Samba.
- `comment`: Description, can be any non-empty string.
- `browsable`: Include the share when browsing `smb://{host}`, `yes` or `no`. Default `yes`.
- `writable`: Whether the share should be writable, `yes` or `no`. Default `yes`.
- `create_mask`: Bit-wise MASK for the UNIX modes of a file. Default `0640`.
- `directory_mask`: Bit-wise MASK for the UNIX modes of a directory. Default `0750`.

## Required facts

| Fact           | Purpose                      |
| -------------- | ---------------------------- |
| `distribution` | Checking system requirements |

## System requirements

- RHEL 8 or newer, including derivatives.
